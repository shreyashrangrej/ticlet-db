/*
  Warnings:

  - The values [ENDUSER] on the enum `UserType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "UserType_new" AS ENUM ('VANILLA', 'CLIENT', 'AGENT', 'SUPPORT', 'MANAGER', 'ADMINISTRATOR');
ALTER TABLE "User" ALTER COLUMN "userType" DROP DEFAULT;
ALTER TABLE "User" ALTER COLUMN "userType" TYPE "UserType_new" USING ("userType"::text::"UserType_new");
ALTER TYPE "UserType" RENAME TO "UserType_old";
ALTER TYPE "UserType_new" RENAME TO "UserType";
DROP TYPE "UserType_old";
ALTER TABLE "User" ALTER COLUMN "userType" SET DEFAULT 'VANILLA';
COMMIT;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "userType" SET DEFAULT 'VANILLA';
