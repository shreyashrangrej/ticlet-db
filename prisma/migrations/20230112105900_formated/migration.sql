/*
  Warnings:

  - You are about to drop the column `userId` on the `Ticket` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_userId_fkey";

-- AlterTable
CREATE SEQUENCE attachment_id_seq;
ALTER TABLE "Attachment" ALTER COLUMN "id" SET DEFAULT nextval('attachment_id_seq');
ALTER SEQUENCE attachment_id_seq OWNED BY "Attachment"."id";

-- AlterTable
ALTER TABLE "Ticket" DROP COLUMN "userId";
