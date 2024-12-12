import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading, Text } from "@radix-ui/themes";
import { NavLink } from "react-router-dom";

const menu = [
  {
    title: "NAVI",
    link: "/navi",
  },
];

export default function Header() {
  return (
    <Container>
      <Flex
        position="sticky"
        top="0"
        px="4"
        py="2"
        className="border-b flex items-center justify-between"
      >
        <Box className="flex-1 flex justify-start">
          <Box>
            <Heading className="flex items-center justify-center gap-3 text-2xl font-bold">NAVI Dapp</Heading>
            <Text className="text-xs mt-1 text-gray-500 text-center">HOH Task6 by JasonRUAN</Text>
          </Box>
        </Box>

        <Box className="flex-1 flex justify-center gap-5">
          {menu.map((item) => (
            <Box key={item.link}>
              <NavLink
                to={item.link}
                className={({ isActive, isPending }) =>
                  `cursor-pointer flex items-center gap-2 ${isPending
                    ? "pending"
                    : isActive
                      ? "font-bold text-blue-600"
                      : ""
                  }`
                }
              >
                {item.title}
              </NavLink>
            </Box>
          ))}
        </Box>

        <Box className="flex-1 flex justify-end mr-4 mt-2 mb-2">
          <ConnectButton className="px-4 py-2 rounded-lg bg-gradient-to-r from-purple-400 to-pink-400 hover:from-purple-500 hover:to-pink-500 text-white font-medium shadow-lg hover:shadow-xl transition-all duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-105 backdrop-blur-sm" />
        </Box>
      </Flex>
    </Container>
  );
};