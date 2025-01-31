import { FlatCompat } from '@eslint/eslintrc';

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

const eslintConfig = [
  ...compat.extends(
    "next/core-web-vitals",
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended"
  ),
  {
    rules: {
      "react/no-unescaped-entities": "error",
      "@typescript-eslint/no-unused-vars": "error",
    },
  },
];

export default eslintConfig;