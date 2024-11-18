export const addZero = (v: number) => {
  if (v < 10) {
    return '0' + v
  } else {
    return '' + v
  }
}

export const getCurrentTime = () => {
  const myDate=new Date();
  const year = myDate.getFullYear();
  const month = myDate.getMonth()+1;
  const date = myDate.getDate();
  const hour = myDate.getHours();
  const min = myDate.getMinutes();
  const second = myDate.getSeconds();
  return {
    year,
    month,
    date,
    hour,
    min,
    second
  }
}
