/*
  Warnings:

  - A unique constraint covering the columns `[phone]` on the table `ClientUser` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phone]` on the table `SupportUser` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `phone` to the `ClientUser` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone` to the `SupportUser` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ClientUser" ADD COLUMN     "phone" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "SupportUser" ADD COLUMN     "phone" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "ClientUser_phone_key" ON "ClientUser"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "SupportUser_phone_key" ON "SupportUser"("phone");
