import { createBrowserRouter, Navigate } from "react-router-dom";

import { Root } from "./root";
import { NAVIDashboard } from "./NAVIDashboard";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    children: [
      {
        path: "/",
        element: <Navigate to="navi" replace />,
      },
      {
        path: "navi",
        element: <NAVIDashboard />,
      },
    ],
  },
]);
