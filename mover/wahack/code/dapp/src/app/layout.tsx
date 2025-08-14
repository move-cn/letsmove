"use client"
import { Inter } from "next/font/google";
import "./globals.css";
import { Providers } from './providers'
import {Box, Flex, Spacer} from "@chakra-ui/react";
import {ConnectButton} from "@mysten/dapp-kit";

const inter = Inter({ subsets: ["latin"] });

// export const metadata: Metadata = {
//   title: "Lets Move",
//   description: "learn move with @the_web3",
// };

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers>
            <Box>
                <Flex bg={"black"} color={"white"} p={4}>
                    <Box pt={2} ml={2}>
                        Lets Learning Move
                    </Box>
                    <Spacer />
                    <Box>
                    <ConnectButton />
                    </Box>
                </Flex>
                {children}
            </Box>
        </Providers>
      </body>
    </html>
  );
}
