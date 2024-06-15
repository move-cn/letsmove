import React from "react";
import ReactDOM from "react-dom/client";
import "@radix-ui/themes/styles.css";
import "@suiet/wallet-kit/style.css";

import { Theme } from "@radix-ui/themes";
import App from "./App.tsx";
import { WalletProvider } from "@suiet/wallet-kit";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <Theme appearance="dark">
      <WalletProvider>
        <App />
      </WalletProvider>
    </Theme>
  </React.StrictMode>,
);
