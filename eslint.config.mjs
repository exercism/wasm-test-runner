import config from '@exercism/eslint-config-tooling'

export default [
  ...config,
  {
    ignores: [
      'bin/*',
      'dist/*',
      'docs/*',
      'node_modules/*',
      'production_node_modules/*',
      'test/fixtures/*',
      'tmp/*',
      '/babel.config.*',
      '/jest.config.*',
      '/jest.runner.config.*',
      '/.eslintrc',
      '/.eslintrc.*',
      '/test/.eslintrc',
      '/test/.eslintrc.*',
    ],
  },
]
