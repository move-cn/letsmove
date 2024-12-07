import { SuiClient } from "@mysten/sui/client";
import { toHex,isValidSuiObjectId } from "@mysten/sui/utils";
import baseX from "base-x";

const BASE36 = "0123456789abcdefghijklmnopqrstuvwxyz";
const b36 = baseX(BASE36);

export type Path = {
    subdomain: string;
    path: string;
};

export const subdomainToObjectId = (subdomain: string) => {
    const objectId = "0x" + toHex(b36.decode(subdomain.toLowerCase()));
    return isValidSuiObjectId(objectId) ? objectId : null;
}

export function removeLastSlash(path: string): string {
    return path.endsWith("/") ? path.slice(0, -1) : path;
}

export function getSubdomainAndPath(scope: string): Path | null {
    const url = new URL(scope);
    const hostname = url.hostname.split(".");

    if (hostname.length === 3 || (hostname.length === 2 && hostname[1] === "localhost")) {
        const path = url.pathname == "/" ? "/index.html" : removeLastSlash(url.pathname);
        return { subdomain: hostname[0], path };
    }
    return null;
}

export async function getBlob(objectId: string) {
    const client = new SuiClient({ url: "https://fullnode.testnet.sui.io:443" });
    return await client.getObject({
        id: objectId,
        options: { showContent: true },
    });
} 