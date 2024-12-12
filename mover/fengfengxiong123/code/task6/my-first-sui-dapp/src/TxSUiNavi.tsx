import { useCurrentAccount } from '@mysten/dapp-kit';
import { Transaction } from '@mysten/sui/transactions';
import { useState } from 'react';

export function TxSUiNavi() {
    const [addr, setAddr] = useState('');
    const currentAccount = useCurrentAccount();
    const myfun = (() => {
        if (currentAccount) {
            setAddr(currentAccount.address)
        }
        const tx = new Transaction();
    })

    return (
        <div>
            <p>{addr}</p>
            <button onClick={myfun}>与navi交互</button>
        </div>
    );
}