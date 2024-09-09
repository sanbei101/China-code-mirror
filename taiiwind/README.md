# 配置TailwindCss+Vue+Prettier环境

## 安装并配置TailwindCss
```
pnpm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

在`tailwind.config.js`中
```js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```
在`style.css`中
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## 配置prettier
```shell
pnpm install -D prettier prettier-plugin-tailwindcss
```
在`.prettierrc`中

```json
{
  "plugins": ["prettier-plugin-tailwindcss"]
}
```


