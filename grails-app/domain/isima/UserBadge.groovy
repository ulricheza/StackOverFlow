package isima

import org.apache.commons.lang.builder.HashCodeBuilder

class UserBadge implements Serializable {

	User  user
	Badge badge

	boolean equals(other) {
		if (!(other instanceof UserBadge)) {
			return false
		}

		other.user?.id == user?.id &&
			other.badge?.id == badge?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (badge) builder.append(badge.id)
		builder.toHashCode()
	}

	static UserBadge get(long userId, long badgeId) {
		find 'from UserBadge where user.id=:userId and badge.id=:badgeId',
			[userId: userId, badgeId: badgeId]
	}

	static UserBadge create(User user, Badge badge, boolean flush = false) {
		new UserBadge(user: user, badge: badge).save(flush: flush, insert: true)
	}

	static boolean remove(User user, Badge badge, boolean flush = false) {
		UserBadge instance = UserBadge.findByUserAndBadge(user, badge)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(User user) {
		executeUpdate 'DELETE FROM UserBadge WHERE user=:user', [user: user]
	}

	static void removeAll(Badge badge) {
		executeUpdate 'DELETE FROM UserBadge WHERE badge=:badge', [badge: badge]
	}

	static mapping = {
		id composite: ['badge', 'user']
		version false
	}
}