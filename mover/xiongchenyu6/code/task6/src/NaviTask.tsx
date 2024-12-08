import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes";
import {
  useCurrentAccount,
  useSignAndExecuteTransaction,
} from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";

import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, wUSDC } from "navi-sdk/dist/address";
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";
import { useState, useEffect, useRef } from "react";

// 1.[Deposit 1 SUI into Navi Protocol]
// 2.[Borrow USDC of the current date 0.[month][day][hour]]
// 3.[Then deposit an equivalent amount of USDC]
export function NaviTask() {
  // Current connected wallet account
  const account = useCurrentAccount();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
  const [digest, setDigest] = useState("");
  const [message, setMessage] = useState("");

  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const gl = canvas.getContext("webgl");
    if (!gl) {
      console.error("WebGL not supported");
      return;
    }

    const vertexShaderSource = `
      attribute vec4 a_position;
      attribute vec4 a_color;
      uniform mat4 u_matrix;
      varying vec4 v_color;
      void main() {
        gl_Position = u_matrix * a_position;
        v_color = a_color;
      }
    `;

    const fragmentShaderSource = `
      precision mediump float;
      varying vec4 v_color;
      void main() {
        gl_FragColor = v_color;
      }
    `;

    const vertexShader = gl.createShader(gl.VERTEX_SHADER);
    gl.shaderSource(vertexShader, vertexShaderSource);
    gl.compileShader(vertexShader);

    const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
    gl.shaderSource(fragmentShader, fragmentShaderSource);
    gl.compileShader(fragmentShader);

    const program = gl.createProgram();
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);
    gl.linkProgram(program);

    const positionBuffer = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
    const positions = [
      0, 1,
      -1, -1,
      1, -1,
    ];
    gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(positions), gl.STATIC_DRAW);

    const colorBuffer = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, colorBuffer);
    const colors = [
      1, 0, 0, 1, // Red
      0, 1, 0, 1, // Green
      0, 0, 1, 1, // Blue
    ];
    gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(colors), gl.STATIC_DRAW);

    const positionLocation = gl.getAttribLocation(program, "a_position");
    const colorLocation = gl.getAttribLocation(program, "a_color");
    const matrixLocation = gl.getUniformLocation(program, "u_matrix");

    let angle = 0;
    function drawScene() {
      gl.clear(gl.COLOR_BUFFER_BIT);

      gl.useProgram(program);

      gl.enableVertexAttribArray(positionLocation);
      gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
      gl.vertexAttribPointer(positionLocation, 2, gl.FLOAT, false, 0, 0);

      gl.enableVertexAttribArray(colorLocation);
      gl.bindBuffer(gl.ARRAY_BUFFER, colorBuffer);
      gl.vertexAttribPointer(colorLocation, 4, gl.FLOAT, false, 0, 0);

      const matrix = [
        Math.cos(angle), Math.sin(angle), 0, 0,
        -Math.sin(angle), Math.cos(angle), 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1,
      ];
      gl.uniformMatrix4fv(matrixLocation, false, matrix);

      gl.drawArrays(gl.TRIANGLES, 0, 3);

      angle += 0.01;
      requestAnimationFrame(drawScene);
    }

    gl.clearColor(0, 0, 0, 0);
    drawScene();
  }, []);

  const deposit_borrow_Sui = async () => {
    if (!account) {
      setMessage("Please connect your wallet first");
      return;
    }

    try {
      const date = new Date();
      const month = date.getMonth() + 1;
      const day = date.getDate();
      const hour = date.getHours();

      const borrow_amount =
        parseFloat(
          `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`,
        ) *
        10 ** wUSDC.decimal;

      const tx = new Transaction();
      tx.setSender(account.address);

      // Ensure pool configurations are valid
      const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
      const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

      if (!suiPool || !wusdcPool) {
        throw new Error("Invalid pool configuration");
      }

      // Deposit SUI
      const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]);
      if (!suiCoin) throw new Error("Failed to split SUI coins");
      
      await depositCoin(tx, suiPool, suiCoin, 1_000_000_000);

      // Borrow and deposit USDC
      const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrow_amount);
      if (!toBorrowCoin) throw new Error("Failed to borrow USDC");

      await depositCoin(tx, wusdcPool, toBorrowCoin, borrow_amount);

      // Clear previous messages
      setMessage("");
      setDigest("");

      await signAndExecuteTransaction(
        { transaction: tx, chain: "sui:mainnet" },
        {
          onSuccess: (result) => {
            console.log("Transaction successful:", result);
            setDigest(result.digest);
          },
          onError: (error) => {
            console.error("Transaction failed:", error);
            setMessage(error.message || "Transaction failed");
          },
        },
      );
    } catch (error) {
      console.error("Error in deposit_borrow_Sui:", error);
      setMessage(error instanceof Error ? error.message : "An unknown error occurred");
    }
  };

  return (
    <Container>
      <Box padding="4" borderRadius="md" boxShadow="md" backgroundColor="white">
        <Heading as="h2" size="lg" marginBottom="4">Navi Protocol Task</Heading>
        <Text marginBottom="4">
          This task will deposit 1 SUI into the Navi Protocol, borrow USDC based on the current date, and then deposit an equivalent amount of USDC.
        </Text>
        <Flex gap="3" direction={"column"}>
          <Button onClick={deposit_borrow_Sui} variant="solid" colorScheme="blue">Deposit and Borrow Sui</Button>
          {digest && (
            <Text color="green.500">Transaction submitted: {digest}</Text>
          )}
          {message && (
            <Text color="red.500">Error: {message}</Text>
          )}
        </Flex>
      </Box>
      <canvas ref={canvasRef} width="300" height="300" style={{ display: 'block', margin: '20px auto' }}></canvas>
    </Container>
  );
}

export default NaviTask;
