/*
  Warnings:

  - You are about to drop the column `numberOfCreditsRequirement` on the `Subject` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Subject" DROP COLUMN "numberOfCreditsRequirement",
ALTER COLUMN "numberOfCredits" DROP NOT NULL;
