import BigNumber from 'bignumber.js';

// Convert large units to small units
export const convertLargeToSmall = (
  from: number | string,
  decimal: number | string,
): string => {
  const x = new BigNumber(from);
  const y = new BigNumber(10).pow(decimal);
  return x.times(y).toFixed();
};

// Convert small units to large units
export const convertSmallToLarge = (
  from: number | string,
  decimal: number | string,
): string => {
  const x = new BigNumber(from);
  const y = new BigNumber(10).pow(decimal);
  return x.dividedBy(y).toFixed();
};

export const formatBigNumber = (from: number | string): string => {
  return new BigNumber(from).toFixed();
};

/*
 *  Returns |                                                                |
 * :-------:|:---------------------------------------------------------------|
 *     1    | If the value of this BigNumber is greater than the value of `n`
 *    -1    | If the value of this BigNumber is less than the value of `n`
 *     0    | If this BigNumber and `n` have the same value
 *  `null`  | If the value of either this BigNumber or `n` is `NaN`
 * :-------:|:---------------------------------------------------------------|
 * */
export const comparedTo = (x: string | number, y: string | number) => {
  const xBigNumber = new BigNumber(x);
  const yBigNumber = new BigNumber(y);
  return xBigNumber.comparedTo(yBigNumber);
};

export const add = (x: string | number, y: string | number): string => {
  const xBigNumber = new BigNumber(x);
  const yBigNumber = new BigNumber(y);
  return xBigNumber.plus(yBigNumber).toFixed();
};

export const subtract = (x: string | number, y: string | number): string => {
  const xBigNumber = new BigNumber(x);
  const yBigNumber = new BigNumber(y);
  return xBigNumber.minus(yBigNumber).toFixed();
};

export const multiply = (x: string | number, y: string | number): string => {
  const xBigNumber = new BigNumber(x);
  const yBigNumber = new BigNumber(y);
  return xBigNumber.times(yBigNumber).toFixed();
};

export const divide = (x: string | number, y: string | number): string => {
  const xBigNumber = new BigNumber(x);
  const yBigNumber = new BigNumber(y);
  return xBigNumber.dividedBy(yBigNumber).toFixed();
};

export const toFixed = (x: string | number, toFixed: number): string => {
  const xBigNumber = new BigNumber(x);
  return xBigNumber.toFixed(toFixed);
};
