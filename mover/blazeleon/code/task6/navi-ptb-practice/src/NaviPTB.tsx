
import { useEffect, useState } from 'react';
import { Form } from "radix-ui";
import { Transaction } from '@mysten/sui/transactions';
import { useCurrentAccount, useSignAndExecuteTransaction } from '@mysten/dapp-kit';
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";
import { pool, Sui, wUSDC } from 'navi-sdk/dist/address';
import { PoolConfig } from 'navi-sdk/dist/types';
import { parseUnits } from "ethers";
import "./styles.css";


type TimezoneOption = 'local' | 'utc';

/**
 * 获取当前日期的金额字符串
 * @param timezone - 时区选项，默认为 'local'
 * @returns 格式化后的金额字符串
 */
const getAmountFromCurrentDate = (timezone: TimezoneOption = 'local'): string => {
    const now = new Date();
    let month: string, day: string, hour: string;
    if (timezone === 'utc') {
        month = String(now.getUTCMonth() + 1).padStart(2, '0');
        day = String(now.getUTCDate()).padStart(2, '0');
        hour = String(now.getUTCHours()).padStart(2, '0');
    } else {
        month = String(now.getMonth() + 1).padStart(2, '0');
        day = String(now.getDate()).padStart(2, '0');
        hour = String(now.getHours()).padStart(2, '0');
    }
    return `0.${month}${day}${hour}`;
}

export function NaviPTB() {
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [submitSuccess, setSubmitSuccess] = useState(false);
    const [message, setMessage] = useState<String>("");
    const [digest, setDigest] = useState<string>("");
    const [defaultSUI, setDefaultSUI] = useState<string>("");
    const [defaultUSDC, setDefaultUSDC] = useState<string>("");
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

    const account = useCurrentAccount();

    //初始化默认值
    useEffect(() => {
        let curAmt = getAmountFromCurrentDate();
        setDefaultUSDC(curAmt);
        setDefaultSUI("1");
    }, []);

    const handleUSDCChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const value = e.target.value;
        // 空值、整数、小数（最多6位小数）
        if (value === '' || /^\d*\.?\d{0,6}$/.test(value)) {
            setDefaultUSDC(value);
        }
    };

    const handleSUIChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const value = e.target.value;
        if (value === '' || /^\d*\.?\d{0,6}$/.test(value)) {
            setDefaultSUI(value);
        }
    };

    const submitTest = async (event) => {
        event.preventDefault(); // 阻止默认表单提交行为
        
        if(!account){
            alert("Please connect your wallet first.");
            return;
        }

        try {
            setIsSubmitting(true);

            // 获取前端表单输入的金额
            const formData = new FormData(event.target);
            const suiAmt = formData.get('deposit')?.toString() || '';
            const usdcAmt = formData.get('borrow')?.toString() || '';

            if (!suiAmt || !usdcAmt) {
                throw new Error('Please fill in all fields');
            }

            // 处理交易逻辑
            // 1.创建 PTB 交易对象
            const tx = new Transaction();
            tx.setSender(account.address);

            // 2.获取 Navi 配置池信息
            const suiPoolConfig: PoolConfig = pool[Sui.symbol as keyof typeof pool];
            const usdcPoolConfig: PoolConfig = pool[wUSDC.symbol as keyof typeof pool];

            // 3. 存入 SUI
            const depositAmt = parseUnits(suiAmt, Sui.decimal);
            const coins = tx.splitCoins(tx.gas, [tx.pure.u64(depositAmt)]);

            await depositCoin(tx, suiPoolConfig, coins[0], tx.pure.u64(depositAmt));

            // 4.借入指定的 wUSDC 
            const borrowAmt = parseUnits(usdcAmt, wUSDC.decimal);
            const borrowNumber = Number(borrowAmt);

            const [usdcCoin] = await borrowCoin(tx, usdcPoolConfig, borrowNumber);

            // 5. 再存入 wUSDC
            await depositCoin(tx, usdcPoolConfig, usdcCoin, borrowNumber);

            // 6. 进行交易
            signAndExecuteTransaction(
                { transaction: tx, chain: "sui:mainnet" },
                {
                    onSuccess: (result: { digest: string }) => {
                        // 7. 记录交易哈希值
                        setDigest(result.digest);
                        setMessage("Transaction submitted successfully");
                        setSubmitSuccess(true);
                    },
                    onError: (error: Error) => {
                        // 8. 错误处理
                        console.error("Transaction failed:", error);
                        setMessage(error.message || "Transaction failed");
                    },
                }
            );

            event.target.reset();
        } catch (error: any) {
            console.error('Transaction failed:', error);
            setMessage(error.message || 'Transaction failed');
        } finally {
            setIsSubmitting(false);
        }

    }

    return (
        <Form.Root className="FormRoot" onSubmit={submitTest}>
            <Form.Field className="FormField" name="deposit">
                <div
                    style={{
                        display: "flex",
                        alignItems: "baseline",
                        justifyContent: "space-between",
                    }}
                >
                    <Form.Label className="FormLabel">SUI</Form.Label>
                    <Form.Message className="FormMessage" match="valueMissing">
                        Please enter the amount of SUI
                    </Form.Message>
                </div>
                <Form.Control asChild>
                    <input className="Input" placeholder="Deposit SUI" 
                        type="text" 
                        inputMode="decimal" 
                        onChange={ handleSUIChange }
                        value={ defaultSUI } required />
                </Form.Control>
            </Form.Field>
            <Form.Field className="FormField" name="borrow">
                <div
                    style={{
                        display: "flex",
                        alignItems: "baseline",
                        justifyContent: "space-between",
                    }}
                >
                    <Form.Label className="FormLabel">wUSDC</Form.Label>
                    <Form.Message className="FormMessage" match="valueMissing">
                        Please enter the amount of wUSDC
                    </Form.Message>
                </div>
                <Form.Control asChild>
                    <input className="Input" placeholder="Borrow wUSDC" 
                        type="text" 
                        inputMode="decimal" 
                        onChange={ handleUSDCChange }
                        value={ defaultUSDC } required />
                </Form.Control>
            </Form.Field>
            <Form.Submit asChild>
                <button className="Button" style={{ marginTop: 10 }} >
                    {isSubmitting ? (
                        <span>Processing...</span>
                    ) : submitSuccess ? (
                        <span>✓ Success!</span>
                    ) : (
                        <span>Submit Transaction</span>
                    )}
                </button>
            </Form.Submit>
            {/* {message && <div style={{ color: 'red', marginTop: 10 }}>{message}</div>} */}
            {submitSuccess?(<div style={{ color: 'green', fontSize: 16, marginTop: 10 }}>{digest}</div>):''}
        </Form.Root>
    );
}