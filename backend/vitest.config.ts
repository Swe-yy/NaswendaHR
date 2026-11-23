import { defineConfig } from 'vitest/config'

export default defineConfig({
    test: {
        globals: true,
        environment: 'node',
        coverage: {
            enabled: true,
            provider: 'istanbul',
            include: ['src/**/*.{ts,tsx}'],
            reporter: ['text', 'html'],
            exclude: ['node_modules/', 'dist/'],
            reportsDirectory: './coverage'
        }
    }
})