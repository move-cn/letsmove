import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { useSuiClient } from '@mysten/dapp-kit';
import { useResolveSuiNSName } from '@mysten/dapp-kit';
import { buildNaviTaskTransaction } from "./NaviTaskFunc";
import { useState, useEffect } from 'react';
import { Transaction } from "@mysten/sui/transactions";

//ui created by cursor ai

export function NaviTask() {
    const client = useSuiClient();

    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
	const [digest, setDigest] = useState('');
	const [showSuccess, setShowSuccess] = useState(false);
	const currentAccount = useCurrentAccount();

    useEffect(() => {
        let timer: NodeJS.Timeout;
        if (showSuccess) {
            timer = setTimeout(() => {
                setShowSuccess(false);
            }, 2000);
        }
        return () => {
            if (timer) clearTimeout(timer);
        };
    }, [showSuccess]);

    const handleClick = async () => {

        let bytes = await buildNaviTaskTransaction(client, currentAccount?.address);
        const tx = Transaction.from(bytes);
        console.log("tx:", tx);

        signAndExecuteTransaction(
            {
                transaction: tx,
            },
            {
                onSuccess: (result) => {
                    console.log('executed transaction:', result);

                    //https://suivision.xyz/txblock/{result.digest}
                    setDigest(`https://suivision.xyz/txblock/${result.digest}`);
                    setShowSuccess(true);
                },

                onError: (error) => {
                    console.error('transaction error:', error);
                },
            },
        );

    };

    return (
        <div className="container">
            <div className="card">
                <h1 className="title">Navi PTB Task</h1>
                
                <div className="task-description">
                    <h2>任务要求</h2>
                    <div className="steps">
                        <div className="step">1. 存入 Navi Protocol 1 SUI</div>
                        <div className="step">2. 借出当前日期的USDC：0.[月][天][小时]</div>
                        <div className="step">3. 存入等额的USDC</div>
                    </div>
                    
                    <div className="time-info">
                        <p>当前时间：2024年4月25日15点</p>
                        <p>借出金额：<code>0.042515</code> USDC</p>
                        <p className="note">注：月、天、小时必须是两位数</p>
                        <p>示例：2024年5月1日2点 → <code>0.050102</code></p>
                    </div>
                </div>

                {currentAccount && (
                    <div className="action-section">
                        <button className="execute-button" onClick={handleClick}>
                            执行交易
                        </button>
                        
                        {showSuccess && (
                            <div className="success-message">
                                <div className="success-icon">✓</div>
                                <div className="success-text">交易执行成功!</div>
                            </div>
                        )}

                        {digest && (
                            <div className="digest-info">
                                <div className="digest-label">交易详情：</div>
                                <a 
                                    href={digest}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="digest-link"
                                >
                                    <div className="link-content">
                                        <span>在 SuiVision 中查看</span>
                                        <span className="external-icon">↗</span>
                                    </div>
                                </a>
                            </div>
                        )}
                    </div>
                )}
            </div>

            <style jsx>{`
                .container {
                    padding: 2rem;
                    max-width: 800px;
                    margin: 0 auto;
                }

                .card {
                    background: white;
                    border-radius: 12px;
                    padding: 2rem;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                }

                .title {
                    color: #000000;
                    margin-bottom: 1.5rem;
                    font-size: 1.8rem;
                    font-weight: 600;
                }

                .task-description {
                    margin-bottom: 2rem;
                }

                .steps {
                    margin: 1rem 0;
                }

                .step {
                    padding: 0.5rem 0;
                    color: #2d2d2d;
                    font-weight: 500;
                }

                .time-info {
                    background: #f0f0f0;
                    padding: 1rem;
                    border-radius: 8px;
                    margin-top: 1rem;
                    color: #2d2d2d;
                }

                .time-info code {
                    background: #d4d4d4;
                    padding: 0.2rem 0.4rem;
                    border-radius: 4px;
                    font-family: monospace;
                    color: #000000;
                }

                .note {
                    color: #444444;
                    font-size: 0.9rem;
                    font-style: italic;
                }

                .action-section {
                    margin-top: 2rem;
                    text-align: center;
                }

                .execute-button {
                    background: #0066dd;
                    color: white;
                    border: none;
                    padding: 0.8rem 2rem;
                    border-radius: 8px;
                    font-size: 1rem;
                    cursor: pointer;
                    transition: background 0.2s;
                    font-weight: 500;
                }

                .execute-button:hover {
                    background: #0052b3;
                }

                .digest-info {
                    margin-top: 1.5rem;
                    padding: 1.2rem;
                    background: #f8f9fa;
                    border-radius: 12px;
                    text-align: left;
                    border: 1px solid #e9ecef;
                }

                .digest-label {
                    color: #2d2d2d;
                    font-weight: 500;
                    margin-bottom: 0.5rem;
                }

                .digest-link {
                    display: block;
                    text-decoration: none;
                    color: #0066dd;
                    padding: 0.8rem;
                    background: white;
                    border-radius: 8px;
                    border: 1px solid #e9ecef;
                    transition: all 0.2s ease;
                }

                .digest-link:hover {
                    background: #f8f9fa;
                    border-color: #0066dd;
                    transform: translateY(-1px);
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                }

                .link-content {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 0.5rem;
                    font-weight: 500;
                }

                .external-icon {
                    font-size: 1.1em;
                }

                @media (hover: hover) {
                    .digest-link:hover .external-icon {
                        transform: translateX(2px) translateY(-2px);
                    }
                }

                .external-icon {
                    transition: transform 0.2s ease;
                }

                .success-message {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 1rem auto;
                    padding: 0.8rem 1.2rem;
                    background-color: #e6f7e6;
                    border: 1px solid #b8e6b8;
                    border-radius: 8px;
                    color: #2e7d32;
                    animation: slideIn 0.3s ease-out, fadeOut 0.3s ease-in 1.7s;
                    max-width: 300px;
                }

                .success-icon {
                    font-size: 1.25rem;
                    margin-right: 0.75rem;
                    color: #2e7d32;
                }

                .success-text {
                    font-weight: 500;
                }

                @keyframes slideIn {
                    from {
                        transform: translateY(-20px);
                        opacity: 0;
                    }
                    to {
                        transform: translateY(0);
                        opacity: 1;
                    }
                }

                @keyframes fadeOut {
                    from {
                        opacity: 1;
                    }
                    to {
                        opacity: 0;
                    }
                }
            `}</style>
        </div>
    );
}
