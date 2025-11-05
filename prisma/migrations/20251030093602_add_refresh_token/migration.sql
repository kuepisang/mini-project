/*
  Warnings:

  - The primary key for the `categories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `name` on the `categories` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - The primary key for the `checkins` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `coupon_issuances` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `coupons` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `email_notifications` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `events` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `organizers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `brand_name` on the `organizers` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `description` on the `organizers` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(300)`.
  - The primary key for the `point_ledger` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `referral_uses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `reviews` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ticket_types` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `tickets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `transaction_items` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `transactions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user_profiles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `display_name` on the `user_profiles` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `bio` on the `user_profiles` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `email` on the `users` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(100)`.
  - You are about to alter the column `full_name` on the `users` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `phone_number` on the `users` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(15)`.
  - The primary key for the `vouchers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `gate` on table `checkins` required. This step will fail if there are existing NULL values in that column.
  - Made the column `scanned_by_user` on table `checkins` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `update_at` to the `coupons` table without a default value. This is not possible if the table is not empty.
  - Made the column `transaction_id` on table `email_notifications` required. This step will fail if there are existing NULL values in that column.
  - Made the column `payload` on table `email_notifications` required. This step will fail if there are existing NULL values in that column.
  - Made the column `description` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `category_id` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `address` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `city` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `province` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `country` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `end_time` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updated_at` on table `events` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updated_at` on table `organizers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `reason` on table `point_ledger` required. This step will fail if there are existing NULL values in that column.
  - Made the column `expires_at` on table `point_ledger` required. This step will fail if there are existing NULL values in that column.
  - Made the column `ticket_id` on table `reviews` required. This step will fail if there are existing NULL values in that column.
  - Made the column `comment` on table `reviews` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `update_at` to the `ticket_types` table without a default value. This is not possible if the table is not empty.
  - Made the column `quota` on table `ticket_types` required. This step will fail if there are existing NULL values in that column.
  - Made the column `sale_start` on table `ticket_types` required. This step will fail if there are existing NULL values in that column.
  - Made the column `sale_end` on table `ticket_types` required. This step will fail if there are existing NULL values in that column.
  - Made the column `checked_in_at` on table `tickets` required. This step will fail if there are existing NULL values in that column.
  - Made the column `voucher_id` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `coupon_issuance_id` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `payment_proof_url` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proof_uploaded_at` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proof_due_at` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `confirm_due_at` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updated_at` on table `transactions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `display_name` on table `user_profiles` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updated_at` on table `user_profiles` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `update_at` to the `vouchers` table without a default value. This is not possible if the table is not empty.
  - Made the column `max_uses` on table `vouchers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `starts_at` on table `vouchers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `ends_at` on table `vouchers` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "public"."checkins" DROP CONSTRAINT "checkins_scanned_by_user_fkey";

-- DropForeignKey
ALTER TABLE "public"."checkins" DROP CONSTRAINT "checkins_ticket_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."coupon_issuances" DROP CONSTRAINT "coupon_issuances_coupon_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."coupon_issuances" DROP CONSTRAINT "coupon_issuances_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."email_notifications" DROP CONSTRAINT "email_notifications_transaction_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."email_notifications" DROP CONSTRAINT "email_notifications_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."events" DROP CONSTRAINT "events_category_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."events" DROP CONSTRAINT "events_organizer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."organizers" DROP CONSTRAINT "organizers_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."point_ledger" DROP CONSTRAINT "point_ledger_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."referral_uses" DROP CONSTRAINT "referral_uses_referee_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."referral_uses" DROP CONSTRAINT "referral_uses_referrer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."reviews" DROP CONSTRAINT "reviews_event_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."reviews" DROP CONSTRAINT "reviews_reviewer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."reviews" DROP CONSTRAINT "reviews_ticket_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."ticket_types" DROP CONSTRAINT "ticket_types_event_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."tickets" DROP CONSTRAINT "tickets_event_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."tickets" DROP CONSTRAINT "tickets_ticket_type_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."tickets" DROP CONSTRAINT "tickets_transaction_item_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transaction_items" DROP CONSTRAINT "transaction_items_event_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transaction_items" DROP CONSTRAINT "transaction_items_ticket_type_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transaction_items" DROP CONSTRAINT "transaction_items_transaction_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transactions" DROP CONSTRAINT "transactions_coupon_issuance_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transactions" DROP CONSTRAINT "transactions_organizer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transactions" DROP CONSTRAINT "transactions_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."transactions" DROP CONSTRAINT "transactions_voucher_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."user_profiles" DROP CONSTRAINT "user_profiles_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."users" DROP CONSTRAINT "users_referred_by_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."vouchers" DROP CONSTRAINT "vouchers_event_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."vouchers" DROP CONSTRAINT "vouchers_organizer_id_fkey";

-- DropIndex
DROP INDEX "public"."categories_name_key";

-- AlterTable
ALTER TABLE "categories" DROP CONSTRAINT "categories_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "name" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "categories_id_seq";

-- AlterTable
ALTER TABLE "checkins" DROP CONSTRAINT "checkins_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "ticket_id" SET DATA TYPE TEXT,
ALTER COLUMN "gate" SET NOT NULL,
ALTER COLUMN "scanned_by_user" SET NOT NULL,
ALTER COLUMN "scanned_by_user" SET DATA TYPE TEXT,
ADD CONSTRAINT "checkins_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "checkins_id_seq";

-- AlterTable
ALTER TABLE "coupon_issuances" DROP CONSTRAINT "coupon_issuances_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "coupon_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "coupon_issuances_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "coupon_issuances_id_seq";

-- AlterTable
ALTER TABLE "coupons" DROP CONSTRAINT "coupons_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "coupons_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "coupons_id_seq";

-- AlterTable
ALTER TABLE "email_notifications" DROP CONSTRAINT "email_notifications_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "transaction_id" SET NOT NULL,
ALTER COLUMN "transaction_id" SET DATA TYPE TEXT,
ALTER COLUMN "payload" SET NOT NULL,
ADD CONSTRAINT "email_notifications_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "email_notifications_id_seq";

-- AlterTable
ALTER TABLE "events" DROP CONSTRAINT "events_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "organizer_id" SET DATA TYPE TEXT,
ALTER COLUMN "description" SET NOT NULL,
ALTER COLUMN "category_id" SET NOT NULL,
ALTER COLUMN "category_id" SET DATA TYPE TEXT,
ALTER COLUMN "address" SET NOT NULL,
ALTER COLUMN "city" SET NOT NULL,
ALTER COLUMN "province" SET NOT NULL,
ALTER COLUMN "country" SET NOT NULL,
ALTER COLUMN "end_time" SET NOT NULL,
ALTER COLUMN "updated_at" SET NOT NULL,
ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "events_id_seq";

-- AlterTable
ALTER TABLE "organizers" DROP CONSTRAINT "organizers_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "brand_name" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "description" SET DATA TYPE VARCHAR(300),
ALTER COLUMN "updated_at" SET NOT NULL,
ADD CONSTRAINT "organizers_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "organizers_id_seq";

-- AlterTable
ALTER TABLE "point_ledger" DROP CONSTRAINT "point_ledger_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "reason" SET NOT NULL,
ALTER COLUMN "related_txn_id" SET DATA TYPE TEXT,
ALTER COLUMN "expires_at" SET NOT NULL,
ADD CONSTRAINT "point_ledger_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "point_ledger_id_seq";

-- AlterTable
ALTER TABLE "referral_uses" DROP CONSTRAINT "referral_uses_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "referrer_id" SET DATA TYPE TEXT,
ALTER COLUMN "referee_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "referral_uses_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "referral_uses_id_seq";

-- AlterTable
ALTER TABLE "reviews" DROP CONSTRAINT "reviews_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "event_id" SET DATA TYPE TEXT,
ALTER COLUMN "reviewer_id" SET DATA TYPE TEXT,
ALTER COLUMN "ticket_id" SET NOT NULL,
ALTER COLUMN "ticket_id" SET DATA TYPE TEXT,
ALTER COLUMN "comment" SET NOT NULL,
ADD CONSTRAINT "reviews_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "reviews_id_seq";

-- AlterTable
ALTER TABLE "ticket_types" DROP CONSTRAINT "ticket_types_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "event_id" SET DATA TYPE TEXT,
ALTER COLUMN "quota" SET NOT NULL,
ALTER COLUMN "sale_start" SET NOT NULL,
ALTER COLUMN "sale_end" SET NOT NULL,
ADD CONSTRAINT "ticket_types_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ticket_types_id_seq";

-- AlterTable
ALTER TABLE "tickets" DROP CONSTRAINT "tickets_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "transaction_item_id" SET DATA TYPE TEXT,
ALTER COLUMN "event_id" SET DATA TYPE TEXT,
ALTER COLUMN "ticket_type_id" SET DATA TYPE TEXT,
ALTER COLUMN "checked_in_at" SET NOT NULL,
ADD CONSTRAINT "tickets_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "tickets_id_seq";

-- AlterTable
ALTER TABLE "transaction_items" DROP CONSTRAINT "transaction_items_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "transaction_id" SET DATA TYPE TEXT,
ALTER COLUMN "event_id" SET DATA TYPE TEXT,
ALTER COLUMN "ticket_type_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "transaction_items_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "transaction_items_id_seq";

-- AlterTable
ALTER TABLE "transactions" DROP CONSTRAINT "transactions_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "organizer_id" SET DATA TYPE TEXT,
ALTER COLUMN "voucher_id" SET NOT NULL,
ALTER COLUMN "voucher_id" SET DATA TYPE TEXT,
ALTER COLUMN "coupon_issuance_id" SET NOT NULL,
ALTER COLUMN "coupon_issuance_id" SET DATA TYPE TEXT,
ALTER COLUMN "payment_proof_url" SET NOT NULL,
ALTER COLUMN "proof_uploaded_at" SET NOT NULL,
ALTER COLUMN "proof_due_at" SET NOT NULL,
ALTER COLUMN "confirm_due_at" SET NOT NULL,
ALTER COLUMN "updated_at" SET NOT NULL,
ADD CONSTRAINT "transactions_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "transactions_id_seq";

-- AlterTable
ALTER TABLE "user_profiles" DROP CONSTRAINT "user_profiles_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "display_name" SET NOT NULL,
ALTER COLUMN "display_name" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "bio" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "updated_at" SET NOT NULL,
ADD CONSTRAINT "user_profiles_pkey" PRIMARY KEY ("user_id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
ADD COLUMN     "refresh_token_version" INTEGER NOT NULL DEFAULT 0,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "email" SET DATA TYPE VARCHAR(100),
ALTER COLUMN "full_name" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "phone_number" SET DATA TYPE VARCHAR(15),
ALTER COLUMN "referred_by_id" DROP NOT NULL,
ALTER COLUMN "referred_by_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "users_id_seq";

-- AlterTable
ALTER TABLE "vouchers" DROP CONSTRAINT "vouchers_pkey",
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "organizer_id" SET DATA TYPE TEXT,
ALTER COLUMN "event_id" SET DATA TYPE TEXT,
ALTER COLUMN "max_uses" SET NOT NULL,
ALTER COLUMN "starts_at" SET NOT NULL,
ALTER COLUMN "ends_at" SET NOT NULL,
ADD CONSTRAINT "vouchers_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "vouchers_id_seq";

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_referred_by_id_fkey" FOREIGN KEY ("referred_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_profiles" ADD CONSTRAINT "user_profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizers" ADD CONSTRAINT "organizers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_organizer_id_fkey" FOREIGN KEY ("organizer_id") REFERENCES "organizers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket_types" ADD CONSTRAINT "ticket_types_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vouchers" ADD CONSTRAINT "vouchers_organizer_id_fkey" FOREIGN KEY ("organizer_id") REFERENCES "organizers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vouchers" ADD CONSTRAINT "vouchers_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon_issuances" ADD CONSTRAINT "coupon_issuances_coupon_id_fkey" FOREIGN KEY ("coupon_id") REFERENCES "coupons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon_issuances" ADD CONSTRAINT "coupon_issuances_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "referral_uses" ADD CONSTRAINT "referral_uses_referrer_id_fkey" FOREIGN KEY ("referrer_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "referral_uses" ADD CONSTRAINT "referral_uses_referee_id_fkey" FOREIGN KEY ("referee_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "point_ledger" ADD CONSTRAINT "point_ledger_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_organizer_id_fkey" FOREIGN KEY ("organizer_id") REFERENCES "organizers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_voucher_id_fkey" FOREIGN KEY ("voucher_id") REFERENCES "vouchers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_coupon_issuance_id_fkey" FOREIGN KEY ("coupon_issuance_id") REFERENCES "coupon_issuances"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transaction_items" ADD CONSTRAINT "transaction_items_transaction_id_fkey" FOREIGN KEY ("transaction_id") REFERENCES "transactions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transaction_items" ADD CONSTRAINT "transaction_items_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transaction_items" ADD CONSTRAINT "transaction_items_ticket_type_id_fkey" FOREIGN KEY ("ticket_type_id") REFERENCES "ticket_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_transaction_item_id_fkey" FOREIGN KEY ("transaction_item_id") REFERENCES "transaction_items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_ticket_type_id_fkey" FOREIGN KEY ("ticket_type_id") REFERENCES "ticket_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checkins" ADD CONSTRAINT "checkins_ticket_id_fkey" FOREIGN KEY ("ticket_id") REFERENCES "tickets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checkins" ADD CONSTRAINT "checkins_scanned_by_user_fkey" FOREIGN KEY ("scanned_by_user") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_reviewer_id_fkey" FOREIGN KEY ("reviewer_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_ticket_id_fkey" FOREIGN KEY ("ticket_id") REFERENCES "tickets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email_notifications" ADD CONSTRAINT "email_notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email_notifications" ADD CONSTRAINT "email_notifications_transaction_id_fkey" FOREIGN KEY ("transaction_id") REFERENCES "transactions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
