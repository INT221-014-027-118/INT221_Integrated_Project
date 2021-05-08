const colors = require('tailwindcss/colors')
module.exports = {
    purge: { content: ['./public/**/*.html', './src/**/*.vue'] },
    darkMode: 'class', // or 'media' or 'class'
    theme: {
        extend: {
            textOpacity: ['dark'],
            colors: {
                sea: {
                    light: '#3fbaeb',
                    DEFAULT: '#0fa9e6',
                    dark: '#0c87b8'
                },
                fuchsia: colors.fuchsia,
                salmon: {
                    darkest: '#EF6351',
                    dark: '#F38375',
                    DEFAULT: '#F7A399',
                    light: '#FBC3BC',
                    lightest: '#FFE3E0'
                }
            }
        }
    },
    variants: {
        extend: {}
    },
    plugins: []
}