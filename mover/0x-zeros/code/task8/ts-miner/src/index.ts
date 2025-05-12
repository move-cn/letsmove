import { mineProof } from './miner';

const MAX_ATTEMPTS = 1_000_000_000;

// 主函数
async function main() {
    try {
        const proof = await mineProof(MAX_ATTEMPTS);
        if (proof) {
            console.log('proof: ', proof);
        }
    } catch (error) {
        console.error('挖矿过程中出错:', error);
    }
}

main().catch(console.error);