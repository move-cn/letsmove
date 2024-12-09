import React, { useState } from "react";
import * as Form from "@radix-ui/react-form";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { useNaviLend } from "@/mutations/navi";
import { Loader2 } from "lucide-react";

export function NAVIDashboard() {

  const [formData, setFormData] = useState({
    supplySUI: 0,
    borrowUSDC: 0,
    resupplyUSDC: 0,
  });

  const naviLend = useNaviLend();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: Number(value),
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await naviLend.mutateAsync(formData);
    } catch (error) {
      // Error is already handled by the mutation
      console.debug('Transaction failed:', error);
    }
  };

  // 格式化数字为两位数
  const formatTwoDigits = (num: number): string => {
    return num.toString().padStart(2, '0');
  };

  const handleAutoFill = () => {
    const now = new Date();
    const month = formatTwoDigits(now.getMonth() + 1);
    const day = formatTwoDigits(now.getDate());
    const hour = formatTwoDigits(now.getHours());
    
    const borrowAmount = Number(`0.${month}${day}${hour}`);
    const resupplyAmount = borrowAmount; // 相同金额

    setFormData({
      supplySUI: 1,
      borrowUSDC: borrowAmount,
      resupplyUSDC: resupplyAmount,
    });
  };

  return (
    <div className="container mx-auto px-4 py-8">
      <Card className="max-w-[600px] mx-auto">
        <CardHeader>
          <CardTitle className="text-center">NAVI Dashboard</CardTitle>
        </CardHeader>
        <CardContent>
          <Form.Root onSubmit={handleSubmit}>
            <div className="grid grid-cols-[220px_200px] gap-6 justify-center mx-auto">
              <Label 
                htmlFor="supplySUI" 
                className="text-right whitespace-nowrap self-center"
              >
                Supply SUI Amount
              </Label>
              <Input
                id="supplySUI"
                name="supplySUI"
                type="number"
                value={formData.supplySUI}
                onChange={handleChange}
                onFocus={(e) => e.target.select()}
                required
              />

              <Label 
                htmlFor="borrowUSDC" 
                className="text-right whitespace-nowrap self-center"
              >
                Borrow USDC Amount
              </Label>
              <Input
                id="borrowUSDC"
                name="borrowUSDC"
                type="number"
                value={formData.borrowUSDC}
                onChange={handleChange}
                onFocus={(e) => e.target.select()}
                required
              />

              <Label 
                htmlFor="resupplyUSDC" 
                className="text-right whitespace-nowrap self-center"
              >
                Re-supply USDC Amount
              </Label>
              <Input
                id="resupplyUSDC"
                name="resupplyUSDC"
                type="number"
                value={formData.resupplyUSDC}
                onChange={handleChange}
                onFocus={(e) => e.target.select()}
                required
              />
            </div>

            <div className="flex justify-center gap-4 mt-6">
              <Button 
                type="button" 
                variant="outline" 
                onClick={handleAutoFill}
                disabled={naviLend.isPending}
              >
                Auto Fill
              </Button>
              <Button 
                type="submit" 
                disabled={naviLend.isPending}
              >
                {naviLend.isPending ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Processing...
                  </>
                ) : (
                  'Submit'
                )}
              </Button>
            </div>

            {/* Show error message if any */}
            {naviLend.error && (
              <div className="mt-4 text-center text-red-500">
                {naviLend.error.message}
              </div>
            )}
          </Form.Root>

          {/* Transaction Status */}
          {naviLend.isPending && (
            <div className="mt-4 text-center text-blue-500">
              Transaction in progress...
            </div>
          )}
          {naviLend.isSuccess && (
            <div className="mt-4 text-center text-green-500">
              Transaction completed successfully!
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
