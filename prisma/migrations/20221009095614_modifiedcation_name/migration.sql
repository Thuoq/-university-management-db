/*
  Warnings:

  - You are about to drop the column `resouceId` on the `ResouceRole` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[code]` on the table `Resource` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `resourceId` to the `ResouceRole` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `Resource` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ResouceRole" DROP CONSTRAINT "ResouceRole_resouceId_fkey";

-- AlterTable
ALTER TABLE "ResouceRole" DROP COLUMN "resouceId",
ADD COLUMN     "resourceId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Resource" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Resource_code_key" ON "Resource"("code");

-- AddForeignKey
ALTER TABLE "ResouceRole" ADD CONSTRAINT "ResouceRole_resourceId_fkey" FOREIGN KEY ("resourceId") REFERENCES "Resource"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
