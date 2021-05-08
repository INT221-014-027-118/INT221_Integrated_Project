<template>
    <div class="h-full md:h-screen py-16 md:py-24 lg:py-36 ">
        <div class="flex flex-col justify-center items-center sm:flex-row lg:w-5/6 mx-auto my-auto">
            <div class="sm:w-1/3 p-4 w-full" v-for="member in teams" :key="member.studentId">
                <div class="px-4 py-8 rounded-lg shadow-2xl text-center bg-blue-100 dark:bg-gray-700">
                    <div class="mb-5">
                        <img class="w-auto mx-auto rounded-full mb-4 h-32" :src="member.img" alt="" />
                        <div class="text-xl font-semibold sm:h-16 md:h-16 lg:h-12">{{ member.name }}</div>
                        <p>{{ member.studentId }}</p>
                        <p class="my-2 pb-2 border-b-2 border-gray-400">ROLE</p>
                        <div class="">
                            <span class="text-blue-900 dark:text-blue-100 block" v-for="role in member.roles" :key="role">{{ role }}</span>
                        </div>
                    </div>
                    <button @click="openGitHib(member.github)" class="px-8 py-3 focus:outline-none cursor-pointer bg-blue-600 text-white rounded-full hover:bg-blue-700">Git Hub</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import cue from "@/assets/team/cue.svg";
import look from "@/assets/team/look.svg";
import top from "@/assets/team/top.svg";

export default {
    data() {
        return {
            teams: [
                {
                    img: cue,
                    studentId: "62130500014",
                    name: "Jakkapong Praditthanachot",
                    roles: ["Frontend", "DataBase", "Network"],
                    github: "https://github.com/jakkapongqcue",
                },
                {
                    img: look,
                    studentId: "62130500027",
                    name: "Traitawat Jitchana",
                    roles: ["Devops", "DataBase", "Backend"],
                    github: "https://github.com/actlook25957",
                },
                {
                    img: top,
                    studentId: "62130500118",
                    name: "Apisit kaewnongsaeng",
                    roles: ["Frontend", "DataBase", "Network"],
                    github: "https://github.com/Top1568",
                },
            ],
        };
    },
    methods: {
        openGitHib(link) {
            let confirm = window.confirm("Open GitHub ?");
            if (confirm) {
                window.open(link);
            }
        },
    },
};
</script>

<style></style>
