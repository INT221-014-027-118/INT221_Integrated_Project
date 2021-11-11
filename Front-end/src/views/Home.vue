<template>
    <div class="flex flex-col pt-20 md:py-32 h-full md:h-screen select-none">
        <div class="w-4/5 mx-auto my-0 md:my-1">
            <div class="flex flex-col items-stretch md:flex-row">
                <item-type
                    v-for="type in types"
                    :key="type.typeId"
                    :type="type"
                    :typeSymbol="
                        itemType[
                            itemType.findIndex((item) => {
                                return item.itmeName === type.typeName;
                            })
                        ]
                    "
                ></item-type>
            </div>
        </div>
        <div class="mx-auto max-w-5xl my-5">
            <router-link
                to="/products"
                class="px-9 py-4 ring-2 flex items-center ring-offset-2 ring-blue-500 ring-offset-blue-500 rounded-lg shadow-2xl 
                bg-blue-100 dark:bg-blue-900 hover:bg-blue-200 transition duration-200 transform dark:hover:bg-blue-700 "
                ><div>
                    <span class="material-icons pr-2">list</span>
                </div>
                <span>All Products</span>
            </router-link>

            <div class="mx-auto my-10 hidden md:inline-flex">
                <router-link
                    to="/form"
                    class="px-9 py-4 ring-2 flex items-center ring-offset-2 ring-green-500 ring-offset-green-500 rounded-full shadow-2xl
                bg-green-100 dark:bg-green-900 hover:bg-green-200 transition duration-200 transform dark:hover:bg-green-700"
                    ><div>
                        <span class="material-icons pr-2 text-2xl">add</span>
                    </div>
                    <span> Add Product</span>
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
import ItemType from "@/components/ItemType.vue";
import headset from "@/assets/headset.svg";
import keyboard from "@/assets/keyboard.svg";
import mouse from "@/assets/mouse.svg";

export default {
    name: "Home",
    components: {
        ItemType,
    },
    data() {
        return {
            itemType: [
                {
                    itmeName: "headset",
                    image: headset,
                    icon: "headset_mic",
                },
                {
                    itmeName: "keyboard",
                    image: keyboard,
                    icon: "keyboard",
                },
                {
                    itmeName: "mouse",
                    image: mouse,
                    icon: "mouse",
                },
            ],
            types: [],
            url:'http://20.205.208.111/refun',
        };
    },
    methods: {
        async getType() {
            await fetch(`${this.url}/type/list`)
                .then((res) => res.json())
                .then((data) => {
                    this.types = data;
                })
                .catch((error) => console.log(error));
        },
    },
    async created() {
        await this.getType();
    },
};
</script>
