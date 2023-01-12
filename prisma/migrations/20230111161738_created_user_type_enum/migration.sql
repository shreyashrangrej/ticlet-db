-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('ENDUSER', 'AGENT', 'MANAGER', 'ADMINISTRATOR');

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userType" "UserType" NOT NULL DEFAULT 'ENDUSER';