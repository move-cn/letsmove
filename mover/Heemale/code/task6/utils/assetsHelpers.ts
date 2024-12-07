import { SuiObjectResponse } from "@mysten/sui/client";

export interface CategorizedObjects {
  coins: {
    [coinType: string]: SuiObjectResponse[];
  };
  objects: {
    [objectType: string]: SuiObjectResponse[];
  };
}

export interface Balance {
  integer: bigint;
  decimal: string;
}

export const categorizeSuiObjects = (objects: SuiObjectResponse[]): CategorizedObjects => {
  return objects.reduce((acc: CategorizedObjects, obj) => {
    const content = obj.data?.content;
    if (content?.dataType !== "moveObject") {
      return acc;
    }

    const type = content.type;
    if (type.startsWith("0x2::coin::Coin<")) {
      const coinType = type.match(/<(.+)>/)?.[1] || "Unknown";
      if (!acc.coins[coinType]) {
        acc.coins[coinType] = [];
      }
      acc.coins[coinType].push(obj);
    } else {
      if (!acc.objects[type]) {
        acc.objects[type] = [];
      }
      acc.objects[type].push(obj);
    }
    return acc;
  }, { coins: {}, objects: {} });
};

export const calculateTotalBalance = (coins: SuiObjectResponse[]): Balance => {
  const total = coins.reduce((sum, coin) => {
    if (coin.data && 'content' in coin.data) {
      const content = coin.data.content;

      if (content && content.dataType === 'moveObject' && 'fields' in content) {
        const fields = content.fields as { balance?: string };
        if ('balance' in fields) {
          const balance = BigInt(fields.balance || '0');
          return sum + balance;
        }
      }
    }
    return sum;
  }, BigInt(0));

  const integer = total / BigInt(10 ** 9);
  const decimal = (total % BigInt(10 ** 9)).toString().padStart(9, '0');
  
  return { integer, decimal };
};

export const formatBalance = (balance: Balance, decimalPlaces: number = 9): string => {
  const integerPart = balance.integer.toString();
  const decimalPart = balance.decimal.slice(0, decimalPlaces);
  return `${integerPart}.${decimalPart}`;
};
