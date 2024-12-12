'use client'
import {ConnectButton, useSignAndExecuteTransaction} from '@mysten/dapp-kit'
import Image from 'next/image'
import {getUserProfile} from '@/lib/contracts'
import {useCurrentAccount} from '@mysten/dapp-kit'
import {useEffect, useState} from 'react'
import {CategorizedObjects, calculateTotalBalance, formatBalance} from '@/utils/assetsHelpers'
import {task6} from "@/lib/contracts/navi";

export default function Home() {
  const account = useCurrentAccount();
  const {mutate: signAndExecuteTransaction} = useSignAndExecuteTransaction();
  const [userObjects, setUserObjects] = useState<CategorizedObjects | null>(null);

  const onClick = async () => {
    const tx = await task6();
    signAndExecuteTransaction(
      {
        transaction: tx,
      },
      {
        onSuccess: async (result) => {
          console.log({digest: result.digest});
          alert(`Success: ${result.digest}`);
        },
        onError: ({message}) => {
          alert(`BuyNode: ${message}`);
        },
      },
    );
  };

  useEffect(() => {
    async function fetchUserProfile() {
      if (account?.address) {
        try {
          const profile = await getUserProfile(account.address);
          setUserObjects(profile);
        } catch (error) {
          console.error('Error fetching user profile:', error);
        }
      }
    }

    fetchUserProfile();
  }, [account]);

  return (
    <div className="min-h-screen flex flex-col">
      <header className="flex justify-between items-center p-4 bg-white shadow-md">
        <div className="flex items-center rounded-full overflow-hidden">
          <Image src="/logo/logo.jpg" alt="Sui Logo" width={80} height={40}/>
        </div>
        <ConnectButton/>
      </header>
      {userObjects != null ? (
        <main className="flex-grow flex flex-col items-center p-8">
          {userObjects && (
            <div className="w-full max-w-6xl">
              <h2 className="text-2xl font-bold mb-4">Your Assets</h2>

              <div className="flex gap-8">
                <div className="flex-1">
                  <h3 className="text-xl font-semibold mb-2">Coins</h3>
                  {Object.entries(userObjects.coins).map(([coinType, coins]) => {
                    const totalBalance = calculateTotalBalance(coins);
                    return (
                      <div key={coinType} className="mb-4 p-4 bg-gray-100 rounded-lg">
                        <h4 className="font-medium text-lg">{coinType.split('::').pop()}</h4>
                        <p>Count: {coins.length}</p>
                        <p>Total Balance: {formatBalance(totalBalance)}</p>
                      </div>
                    );
                  })}
                </div>

                <div className="flex-1">
                  <h3 className="text-xl font-semibold mb-2">Other Objects</h3>
                  <div className="h-[500px] overflow-y-auto pr-4">
                    {Object.entries(userObjects.objects).map(([objectType, objects]) => (
                      <div key={objectType} className="mb-4 p-4 bg-gray-100 rounded-lg">
                        <h4 className="font-medium text-lg">{objectType.split('::').pop()}</h4>
                        <p>Count: {objects.length}</p>
                        <p className="text-gray-500 text-sm">{objectType.split('::').pop()}</p>
                        <p className="text-gray-500 text-sm">{objectType.split('::')[0]}</p>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          )}
          <div>
            <button
              className="relative inline-block bg-gradient-to-r from-[#40cafd] to-[#1993ee] text-black font-bold text-center text-lg py-3 px-6 rounded-lg shadow-lg transition-transform transform active:scale-95 cursor-pointer"
              onClick={onClick}
            >
              task6
            </button>
          </div>
        </main>
      ) : (
        <div className="flex-grow flex flex-col items-center p-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-8">Welcome to Nextjs Sui Dapp Template</h1>
          <h3 className="text-2xl font-bold text-gray-800 mb-8">Please connect your wallet to view your assets</h3>
        </div>
      )}
    </div>
  );
}
