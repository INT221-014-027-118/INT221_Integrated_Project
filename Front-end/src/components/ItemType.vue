<template>
    <div class="md:w-1/3 p-3 md:p-3 lg:p-4 cursor-pointer transition duration-200 ease-in-out transform hover:-translate-y-1 hover:scale-110">
        <router-link
            :to="{
                name: 'ProductsListTypes',
                params: { type: type.typeName},
            }"
        >
            <div class="h-28 md:h-32 lg:h-52 rounded-t-lg bg-contain bg-white bg-no-repeat bg-top" :style="{ backgroundImage: `url(${typeSymbol.image})` }"></div>
            <div class="flex justify-center items-center p-3 sm:p-6 rounded-b-lg shadow-2xl text-center bg-blue-200 dark:bg-blue-900">
                <i class="material-icons p-3 md:p-3 lg:p-6 rounded-full bg-blue-700 text-white mr-3">{{ typeSymbol.icon }}</i>
                <span class="text-xl font-mono uppercase">{{ type.typeName }}</span>
            </div>
        </router-link>
    </div>
</template>

<script>
export default {
    data() {
        return {};
    },
    props: {
        type: Object,
        typeSymbol: Object,
    },
};
</script>
