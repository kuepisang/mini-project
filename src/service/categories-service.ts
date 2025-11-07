import prisma from "../config/prisma-client";
import { categories } from "../generated/prisma";

export async function createCategoriesService({
    name
}: Pick<categories, 'name'>) {
    // pertama kita buat findMany untuk mencari berdasarkan nama categories yang kita punya
    const getAllCategories = await prisma.categories.findMany({
        where: {
            name
        }
    })

    if (getAllCategories.length) {
        throw new Error('Category already exists');
    }

    // kemudian kita buat findUnique untuk mencari berdasarkan primary key atau unique key yang ada di tabel categories
    const category = await prisma.categories.findUnique({
        where: {
            name
        }
    });

    if (category) {
        throw new Error('Category already exists');
    }

    // kemudian kita buat create untuk menambahkan data categories baru
    await prisma.categories.create({
        data: {
            name
        }
    })

    // kemudian kita buat update untuk mengupdate data categories yang sudah ada berdasarkan id categories yang kita punya
    await prisma.categories.update({
        where: {
            id: category.id // pastikan category tidak null sebelum mengakses id, maka dari itu kita perlu menambahkan pengecekan di atas dengan cara mencari data categories terlebih dahulu kemudian baru di update
        },
        data: {
            name
        }
    });

    // kemudian kita buat delete untuk menghapus data categories yang sudah ada berdasarkan id categories yang kita punya
    await prisma.categories.delete({
        where: {
            id: category.id
        }
    });
}