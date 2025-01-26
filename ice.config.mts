import { defineConfig } from '@ice/app';
import request from '@ice/plugin-request';
import store from '@ice/plugin-store';
import auth from '@ice/plugin-auth';

// The project config, see https://v3.ice.work/docs/guide/basic/config
const minify = process.env.NODE_ENV === 'production' ? 'swc' : false;
const BUILD_VERSION = process.env['BUILD_VERSION'];
const publicPath = BUILD_VERSION ? `/${BUILD_VERSION}/` : '/';
export default defineConfig(() => ({
	// codeSplitting: 'vendors',
	// BUILD_VERSION? 'vendors': true,
	publicPath,
  ssg: false,
  minify,
  plugins: [request(), store(), auth()],
  compileDependencies: false,
}));
