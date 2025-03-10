import { Container } from "@radix-ui/themes";
import { WalletStatus } from "./components/WalletStatus";
import { Header } from "./components/Header";
import { Task } from "./components/Task";
function App() {
  return (
    <Container>
      <Header />
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
          <Task />
        </Container>
      </Container>
    </Container>
  );
}

export default App;
