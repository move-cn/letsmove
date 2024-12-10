import { useWallet, useAccountBalance, formatSUI } from "@suiet/wallet-kit";

export default function WalletStatus() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();

  const uint8arrayToHex = (value) => {
    if (!value) return "";
    return value.toString("hex");
  };

  if (!wallet.connected) {
    return <p>Please connect your wallet</p>;
  }

  return (
    <div className="wallet-status">
      <p>Wallet: {wallet.adapter?.name}</p>
      <p>Status: {wallet.connecting ? "connecting" : wallet.connected ? "connected" : "disconnected"}</p>
      <p>Address: {wallet.account?.address}</p>
      <p>Network: {wallet.chain?.name}</p>
      <p>Balance: {formatSUI(balance ?? 0, { withAbbr: false })} SUI</p>
      <p>Public Key: {uint8arrayToHex(wallet.account?.publicKey)}</p>
    </div>
  );
}
