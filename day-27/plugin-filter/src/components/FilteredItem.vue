<template>
  <div class="mt-5">
    <h1 class="font-bold"><slot></slot></h1>
    <hr />
    <div>
      {{
        loading ? "loading..." : data.length > 1 ? "" : "Data tidak ditemukan"
      }}
    </div>
    <div class="selected-item flex flex-wrap">
      <div
        v-for="(list, idx) in data"
        class="w-1/3 p-2 mx-auto"
        style="min-width:200px"
        v-bind:key="idx"
      >
        <div class="flex">
          <div class="title">
            <span>Judul {{ list.id }}</span>
          </div>
          <button class="btn font-bold float-right" v-on:click="addArray(list)">
            +
          </button>
        </div>
        <div>
          <img :src="list.thumbnailUrl" class="img-box" alt="" />
        </div>
        <div class="text-left font-bold text-blue-500 pt-2">
          {{ list.price | formatPrice }}
        </div>
        <div :title="list.title" class="text-left my-1">
          {{ trim(list.title) }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "FilteredItem",
  props: {
    data: {
      type: Array,
      required: true,
    },
    loading: {
      type: Boolean,
    },
  },
  model: {
    prop: "button",
    event: "click",
  },

  methods: {
    addArray(data) {
      return this.$emit("click", data);
    },
    trim: function(words, count = 15, seperator = "...") {
      if (words.length > count) words = words.slice(0, count) + seperator;

      return words;
    },
  },

  computed: {},
};
</script>

<style></style>
