import { calculateFlag } from './generate-flag';

const flagStr: string = "2843t&O\\&l?jv$aoB+;~me?{";
const githubId: string = "Tian-Hun";

const flag: string = calculateFlag(flagStr, githubId);
console.log(`Calculated flag: ${flag}`);