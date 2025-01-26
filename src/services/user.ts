import type { LoginParams, LoginResult, UserInfo } from '@/interfaces/user';
import cookie from 'js-cookie'

const adminInfo: UserInfo = {
  name: 'Admin',
  avatar: 'https://img.alicdn.com/tfs/TB1.ZBecq67gK0jSZFHXXa9jVXa-904-826.png',
  userid: '00000001',
  userType: 'admin',
};
const userInfo: UserInfo = {
  name: 'User',
  avatar: 'https://img.alicdn.com/tfs/TB1.ZBecq67gK0jSZFHXXa9jVXa-904-826.png',
  userid: '00000002',
  userType: 'user',
};
// let currentUserInfo: UserInfo | {} = {};

const waitTime = (time = 1000) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(true);
    }, time);
  });
};

export async function login(data: LoginParams): Promise<LoginResult> {
  // return await request.post('/login', data);
  const { username, password } = data;
  await waitTime();
  if (username === 'admin' && password === 'ice') {
    // currentUserInfo = adminInfo;
		cookie.set("userid", adminInfo.userid)
    return {
      success: true,
      userType: 'admin',
    };
  }
  if (username === 'user' && password === 'ice') {
    // currentUserInfo = userInfo;
		cookie.set("userid", userInfo.userid)
    return {
      success: true,
      userType: 'user',
    };
  }
  // currentUserInfo = {};
  return {
    success: false,
    userType: 'guest',
  };
}

export async function fetchUserInfo() {
  // return await request.get('/user');
	// return currentUserInfo;
	if (cookie.get("userid") === '00000001') {
		return adminInfo;
	} else if (cookie.get("userid") === '00000002') {
		return userInfo;
	} else {
		return {};
	}
}

export async function logout() {
  // return await request.post('/logout');
  console.log('logout');
}
