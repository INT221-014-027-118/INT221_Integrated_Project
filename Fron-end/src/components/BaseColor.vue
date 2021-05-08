<template>
    <div class="w-7 h-7 m-2 text-center rounded-md cursor-pointer flex items-center justify-center" :style="{ backgroundColor: color.hexColor }" @click="activeColor">
        <span class="material-icons ring-4 rounded-md ring-offset-gray-100 ring-offset-2" v-show="color.active" :class="{ 'ring-blue-400 text-blue-500': color.active }">
            done
        </span>
    </div>
</template>

<script>
export default {
    data() {
        return {};
    },
    props: {
        color: {
            type: Object,
        },
    },
    methods: {
        activeColor() {
            if (this.color.active === true) {
                this.$emit("active-color", false);
            } else {
                this.active = !this.active;
                this.$emit("active-color", this.active);
            }
        },
    },
};
</script>

<style></style>
