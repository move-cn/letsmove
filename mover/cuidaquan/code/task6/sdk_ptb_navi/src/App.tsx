import { ConnectButton, useCurrentAccount, useSuiClient, useSignAndExecuteTransaction } from '@mysten/dapp-kit';
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { NAVISDKClient, depositCoin, borrowCoin, repayDebt, pool } from 'navi-sdk';
import { useEffect, useState } from 'react';

/**
 * Navi Protocol PTB Demo 应用
 * 演示如何在同一个 PTB 中执行多个操作：
 * 1. 存入 1 SUI
 * 2. 借出 USDC（金额基于当前时间）
 * 3. 存入等额的 USDC
 */
function App() {
  // 使用 dapp-kit 获取当前账户和 Sui 客户端
  const account = useCurrentAccount();
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();
  const [loading, setLoading] = useState(false);
  const [sdk, setSdk] = useState<NAVISDKClient | null>(null);

  // 初始化 Navi SDK
  useEffect(() => {
    setSdk(new NAVISDKClient({ networkType: 'mainnet' }));
  }, []);

  /**
   * 根据当前时间生成借出金额
   * 格式：MMDDHH（月日时）
   * 例如：3月15日14时 = 031514
   */
  const formatTimeAmount = () => {
    const now = new Date();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hour = String(now.getHours()).padStart(2, '0');
    return parseInt(`${month}${day}${hour}`);
  };

  /**
   * 执行交易的主要函数
   * 在同一个 PTB 中执行三个操作：
   * 1. 存入 1 SUI
   * 2. 借出 USDC（金额基于当前时间）
   * 3. 存入等额的 USDC
   */
  const handleTransaction = async () => {
    if (!account || !sdk) return;

    try {
      setLoading(true);
      // 创建新的交易块
      const txb = new TransactionBlock();
      
      // 准备存入的 SUI 金额（1 SUI = 1_000_000_000 MIST）
      const depositAmount = 1_000_000_000;
      const [depositSuiCoin] = txb.splitCoins(txb.gas, [txb.pure(depositAmount)]);
      
      // 准备借出的 USDC 金额（基于当前时间）
      const borrowAmount = formatTimeAmount();

      // 在同一个 PTB 中执行三个操作
      try {
        // 1. 存入 SUI
        await depositCoin(txb as any, pool.Sui, depositSuiCoin, depositAmount);
        
        // 2. 借出 USDC
        const [borrowedUsdcCoin] = await borrowCoin(txb as any, pool.nUSDC, borrowAmount);
        
        // 3. 使用借出的 USDC 还款
        await repayDebt(txb as any, pool.nUSDC, borrowedUsdcCoin, borrowAmount);

        // 签名并执行交易
        signAndExecute(
          {
            transaction: txb.serialize(),
            chain: 'sui:mainnet'
          },
          {
            onSuccess: async (result) => {
              try {
                // 等待交易完成
                await suiClient.waitForTransaction({ digest: result.digest });
                console.log('Transaction successful:', result);
                alert('交易执行成功！');
              } catch (error) {
                console.error('等待交易确认时出错:', error);
                alert('交易已提交但确认失败，请检查钱包历史记录');
              } finally {
                setLoading(false);
              }
            },
            onError: (error) => {
              console.error('Transaction failed:', error);
              alert('交易执行失败: ' + (error as Error).message);
              setLoading(false);
            }
          }
        );
      } catch (error) {
        console.error('准备交易时出错:', error);
        alert('准备交易时出错: ' + (error as Error).message);
        setLoading(false);
      }
    } catch (error) {
      console.error('Transaction failed:', error);
      setLoading(false);
    }
  };

  return (
    <div style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      backgroundColor: '#f5f5f5',
      padding: '40px 20px'
    }}>
      <div style={{
        maxWidth: '600px',
        width: '100%',
        backgroundColor: 'white',
        borderRadius: '12px',
        padding: '32px',
        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)'
      }}>
        <h1 style={{
          fontSize: '28px',
          fontWeight: 600,
          color: '#1a1a1a',
          marginBottom: '24px',
          textAlign: 'center'
        }}>
          Navi Protocol PTB Demo
        </h1>
        
        {/* 钱包连接区域 */}
        <div style={{
          marginBottom: '32px',
          display: 'flex',
          justifyContent: 'center'
        }}>
          <ConnectButton />
        </div>

        {/* 交易执行区域 */}
        {account && (
          <div style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            gap: '16px'
          }}>
            <div style={{
              padding: '16px',
              backgroundColor: '#f8f9fa',
              borderRadius: '8px',
              width: '100%',
              marginBottom: '16px'
            }}>
              <p style={{
                margin: '0 0 8px 0',
                color: '#666',
                fontSize: '14px'
              }}>
                Connected Address:
              </p>
              <p style={{
                margin: 0,
                fontSize: '14px',
                wordBreak: 'break-all',
                fontFamily: 'monospace'
              }}>
                {account.address}
              </p>
            </div>
            
            <button
              onClick={handleTransaction}
              disabled={loading || !sdk}
              style={{
                padding: '12px 24px',
                fontSize: '16px',
                fontWeight: 500,
                cursor: loading ? 'not-allowed' : 'pointer',
                backgroundColor: loading ? '#e2e8f0' : '#3b82f6',
                color: loading ? '#94a3b8' : 'white',
                border: 'none',
                borderRadius: '8px',
                transition: 'all 0.2s ease',
                width: '100%',
                maxWidth: '300px',
                boxShadow: loading ? 'none' : '0 2px 4px rgba(59, 130, 246, 0.2)'
              }}
            >
              {loading ? 'Processing...' : 'Execute Transaction'}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

export default App;