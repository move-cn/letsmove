import { useEffect, useState } from "react";
import { Flex, Heading, Table } from "@radix-ui/themes";

import { client } from "./navi-client";
import { CoinIcon } from "./CoinIcon";

type Portfolio = {
    reserveName: string;
    borrowBalance: string;
    supplyBalance: string;
};

export const NaviPortfolio: React.FC = () => {
    const [accountPortfolio, setAccountPortfolio] = useState<Portfolio[] | null>(null);
    const account = client.accounts[0];

    const coinIconSrc = (reserveName: string) => {
        if (reserveName.includes('Sui')) {
            return `https://app.naviprotocol.io/imgs/token/${reserveName.replace('Sui', '').toLowerCase()}`;
        }
        return `https://app.naviprotocol.io/imgs/token/${reserveName.toLowerCase()}`;
    };

    useEffect(() => {
        account.getNAVIPortfolio().then((portfolio) => {
            const accountPortfolioArray = Array.from(portfolio).map(([key, value]) => {
                console.log(key, value);
                return {
                    reserveName: key,
                    borrowBalance: value.borrowBalance.toString().replace('NaN', '0'),
                    supplyBalance: value.supplyBalance.toString().replace('NaN', '0'),
                };
            });
            setAccountPortfolio(accountPortfolioArray);
        });
    }, []);

    return (
        <>
        <Heading mt="3" mb="2" size="4">Account Portfolio</Heading>
        <Table.Root>
            <Table.Header>
                <Table.Row>
                <Table.ColumnHeaderCell>Reserve Name</Table.ColumnHeaderCell>
                <Table.ColumnHeaderCell>Borrow Balance</Table.ColumnHeaderCell>
                <Table.ColumnHeaderCell>Supply Balance</Table.ColumnHeaderCell>
                </Table.Row>
            </Table.Header>

            <Table.Body>
                {accountPortfolio?.map((row) => (
                    <Table.Row key={row.reserveName}>
                        <Table.RowHeaderCell>
                            <Flex gap='3' align='center'>
                                <CoinIcon
                                    src={coinIconSrc(row.reserveName)}
                                    alt={row.reserveName}
                                />
                                {row.reserveName}
                            </Flex>
                        </Table.RowHeaderCell>
                        <Table.Cell>{row.borrowBalance}</Table.Cell>
                        <Table.Cell>{row.supplyBalance}</Table.Cell>
                    </Table.Row>
                ))}
            </Table.Body>
        </Table.Root>
        </>
    )
};