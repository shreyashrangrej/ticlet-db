/*
  Warnings:

  - The values [agent,support,manager,administrator] on the enum `UserType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "UserType_new" AS ENUM ('Agent', 'Support', 'Manager', 'Administrator');
ALTER TABLE "SupportUser" ALTER COLUMN "userType" DROP DEFAULT;
ALTER TABLE "SupportUser" ALTER COLUMN "userType" TYPE "UserType_new" USING ("userType"::text::"UserType_new");
ALTER TYPE "UserType" RENAME TO "UserType_old";
ALTER TYPE "UserType_new" RENAME TO "UserType";
DROP TYPE "UserType_old";
ALTER TABLE "SupportUser" ALTER COLUMN "userType" SET DEFAULT 'Support';
COMMIT;

-- AlterTable
ALTER TABLE "SupportUser" ALTER COLUMN "userType" SET DEFAULT 'Support';
