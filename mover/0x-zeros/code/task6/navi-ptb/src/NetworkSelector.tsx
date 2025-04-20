import { useSuiClientContext } from "@mysten/dapp-kit";

function NetworkSelector() {
	const ctx = useSuiClientContext();
 
	return (
		<div>
			{Object.keys(ctx.networks).map((network) => (
				<button key={network} onClick={() => {
                    console.log(network);
                    ctx.selectNetwork(network)
                }}>
					{`select ${network}`}
				</button>
			))}
		</div>
	);
}

export default NetworkSelector;