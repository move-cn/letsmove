import { useCurrentAccount, useSignAndExecuteTransaction } from '@mysten/dapp-kit';
import { Transaction } from '@mysten/sui/transactions';
import { useState } from 'react';
import { pool, wUSDC } from 'navi-sdk/dist/address';
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { CoinInfo, Pool, PoolConfig } from 'navi-sdk/dist/types';
import ClipLoader from "react-spinners/ClipLoader";

const NaviPage = () => {
    const currentAccount = useCurrentAccount();
    const { mutate: signAndExecute } = useSignAndExecuteTransaction();
    const [loading, setLoading] = useState(false);

    const handleNaviOperation = async () => {
        if (!currentAccount) {
            alert('请先连接钱包');
            return;
        }

        setLoading(true);
        try {
            // 创建交易并设置发送者
            const tx = new Transaction();
            tx.setSender(currentAccount.address);

            // 1.拆分出 1 SUI
            const suiAmount = 1_000_000_000; // 1 SUI = 1e9 MIST
            const suiPoolConfig: PoolConfig = pool['Sui'];

            // 打印配置信息
            console.log('Transaction Details:', {
                sender: currentAccount.address,
                suiAmount,
                suiPoolConfig: {
                    ...suiPoolConfig,
                    poolId: suiPoolConfig.poolId,
                    type: suiPoolConfig.type
                }
            });

            const [splitCoin] = tx.splitCoins(tx.gas, [suiAmount]);

            // 2.调用depositCoin存入SUI
            await depositCoin(
                tx,
                suiPoolConfig,
                splitCoin,
                suiAmount
            );

            // 3. 计算要借出的USDC金额
            const date = new Date();
            const month = date.getMonth() + 1;
            const day = date.getDate();
            const hour = date.getHours();
            const usdcAmount = parseFloat(`0.${month}${day}${hour}`);
            const usdcAmountInCorretcPrecision = usdcAmount * Math.pow(10, wUSDC.decimal);

            // 4. 构建USDC的PoolConfig
            const toBorrowCoin: CoinInfo = wUSDC;
            const loanPoolConfig: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];

            // 打印USDC相关配置
            console.log('USDC Operation Details:', {
                usdcAmount,
                usdcAmountInCorretcPrecision,
                loanPoolConfig: {
                    ...loanPoolConfig,
                    poolId: loanPoolConfig.poolId,
                    type: loanPoolConfig.type
                },
                wUSDC: {
                    symbol: wUSDC.symbol,
                    decimal: wUSDC.decimal
                }
            });

            // 5. 调用borrowCoin借出USDC
            const [borrowUSDC] = await borrowCoin(
                tx,
                loanPoolConfig,
                usdcAmountInCorretcPrecision,
            );

            // 6. 调用depositCoin将借来的USDC存入USDC池子
            await depositCoin(
                tx,
                loanPoolConfig,
                borrowUSDC,
                usdcAmountInCorretcPrecision
            );

            // 打印最终交易信息
            console.log('Final Transaction:', {
                sender: currentAccount.address,
                transaction: tx
            });

            // 7. 执行交易
            signAndExecute(
                {
                    transaction: tx,
                },
                {
                    onSuccess: (result) => {
                        console.log('交易成功:', result);
                        alert('操作成功完成!');
                    },
                    onError: (error) => {
                        console.error('交易失败:', error);
                        alert('交易失败: ' + error.message);
                    },
                }
            );

        } catch (error) {
            console.error('操作失败:', error);
            console.error('错误堆栈:', (error as Error).stack);
            alert('操作失败: ' + (error as Error).message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="navi-page">
            <button
                onClick={handleNaviOperation}
                disabled={loading || !currentAccount}
                className={`navi-button ${loading ? 'loading' : ''}`}
            >
                {loading ? <ClipLoader size={20} color="#ffffff" /> : '执行Navi操作'}
            </button>

            <style>{`
                .navi-page {
                    padding: 20px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 200px;
                }
                
                .navi-button {
                    padding: 12px 24px;
                    font-size: 16px;
                    border-radius: 8px;
                    background: #4CAF50;
                    color: white;
                    border: none;
                    cursor: pointer;
                    transition: all 0.3s;
                    min-width: 140px;
                    min-height: 45px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .navi-button:disabled {
                    background: #cccccc;
                    cursor: not-allowed;
                }

                .navi-button.loading {
                    opacity: 0.7;
                }

                .navi-button:hover:not(:disabled) {
                    background: #45a049;
                }
            `}</style>
        </div>
    );
};

export default NaviPage;
