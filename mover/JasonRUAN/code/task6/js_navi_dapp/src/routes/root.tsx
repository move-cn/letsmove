import { Toaster } from "react-hot-toast";
import { Outlet } from "react-router-dom";
import Header from "@/components/Header";
import { Container } from "@radix-ui/themes";

export function Root() {
  return (
    <div>
      <Toaster position="bottom-center" />
      <Header />
      <Container>
        <div className="bg-white grid place-items-center font-mono tracking-wider p-5">
          <Outlet />
        </div>
      </Container>
    </div>
  );
}